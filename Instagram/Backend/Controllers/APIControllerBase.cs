namespace Backend.Controllers;

using Microsoft.AspNetCore.Mvc;
using System.Text.Json;

using Backend.Models;
using System.Text.Json.Serialization;
using System.Reflection;
using System.ComponentModel.DataAnnotations.Schema;
using System.Collections;
using System.Reflection.Emit;
using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;

[ApiController]
[Route("api/[controller]")]
public class APIControllerBase<T> : ControllerBase  
    where T : ModelBase, new()
{
    public List<T> Data { get; set; } = new List<T> { };

    public APIControllerBase()
    {
        Load();
    }

    [HttpGet]
    public IEnumerable<T> Get()
    {
        return Data.Cast<T>();
    }

    [HttpGet("{id}")]
    public T Get(int id)
    {
        return Data.Find(x => x.id == id);
    }

    [HttpPost]
    public void Post([FromBody] Dictionary<string, JsonElement> value)
    {
        // Get the last id
        var last = Data.LastOrDefault();
        // Set the id of the new value
        value["id"] = JsonDocument.Parse($"{last?.id + 1 ?? 1}").RootElement;
        // Create a new instance of the model
        var model = new T();
        // Set the properties of the model
        foreach (var property in value)
        {
            var prop = typeof(T).GetProperty(property.Key);
            if (prop == null) continue;
            Match(prop, value, model, property);
        }
        Save();
    }

    [HttpPut("{id}")]
    public void Put(int id, [FromBody] T value)
    {
        var index = Data.FindIndex(x => x.id == id);
        Data[index] = value;
    }

    private void Match<TE>( in PropertyInfo prop, in Dictionary<string, JsonElement> item, in TE model , in KeyValuePair<string, JsonElement> property)
    {
        if (prop.PropertyType == typeof(string))
        {
            prop.SetValue(model, item[property.Key].ToString());
        }
        else if (prop.PropertyType == typeof(int))
        {
            prop.SetValue(model, item[property.Key].GetInt32());
        }
        else if (prop.PropertyType == typeof(string[]))
        {
            string[] strings = new string[item[property.Key].GetArrayLength()];
            for (int i = 0; i < strings.Length; i++)
            {
                strings[i] = item[property.Key][i].ToString();
            }
            prop.SetValue(model, strings);
        }
        else if (prop.PropertyType == typeof(bool))
        {
            prop.SetValue(model, item[property.Key].GetBoolean());
        }
        
    }

    private void Load()
    {
        // load the json first, then deserialize it
        var type = typeof(T);
        var path = $"Data/{type.Name}.json";
        // if the file doesn't exist, create it
        if (System.IO.File.Exists(path) == false)
        {
            System.IO.File.Create(path);
            System.IO.File.WriteAllText(path, "[]");
            return;
        }
        var json = System.IO.File.ReadAllText(path);
        var result = System.Text.Json.JsonSerializer.Deserialize<List<Dictionary<string, JsonElement>>>(json);

        foreach (var item in result!)
        {
            var model = new T();
            foreach (var property in item)
            {
                var prop = type.GetProperty(property.Key);
                if (prop == null) continue;
                Match(prop, item, model, property);
                
                // if the property is a foreign key
                var foreignKey = prop.GetCustomAttribute<ForeignKeyAttribute>();
                if (foreignKey != null)
                {
                    var foreignType = prop.PropertyType;
                    var foreignTypeName = foreignType.Name;
                    // check if the foreign type is an array
                    if (foreignType.IsArray)
                    {
                        // get the type of the array
                        foreignTypeName = foreignType.GetElementType()!.Name;
                    }
                    var foreignPath = $"Data/{foreignTypeName}.json";
                    var foreignJson = System.IO.File.ReadAllText(foreignPath);
                    var foreignResult = System.Text.Json.JsonSerializer.Deserialize<List<Dictionary<string, JsonElement>>>(foreignJson);
                    if (foreignType.IsArray)
                    {
                        var array = Array.CreateInstance(foreignType.GetElementType()!, property.Value.GetArrayLength());
                        for (int i = 0; i < array.Length; i++)
                        {
                            var foreignModel = Activator.CreateInstance(foreignType.GetElementType()!);
                            // Get the matched foreign key
                            var foreignProperty = foreignResult!.Find(x => x["id"].GetInt32() == item[prop.Name][i].GetInt32());
                            // Set the properties of the foreign model
                            foreach (var foreignProp in foreignProperty!)
                            {
                                var foreignPropertyInfo = foreignType.GetElementType()!.GetProperty(foreignProp.Key);
                                if (foreignPropertyInfo == null) continue;
                                Match(foreignPropertyInfo, foreignProperty, foreignModel, foreignProp);
                            }
                            array.SetValue(foreignModel, i);
                        }
                        prop.SetValue(model, array);
                    }
                    else
                    {
                        var foreignModel = Activator.CreateInstance(foreignType);
                        // Get the matched foreign key
                        var foreignProperty = foreignResult!.Find(x => x["id"].GetInt32() == item[prop.Name].GetInt32());
                        // Set the properties of the foreign model
                        foreach (var foreignProp in foreignProperty!)
                        {
                            var foreignPropertyInfo = foreignType.GetProperty(foreignProp.Key);
                            if (foreignPropertyInfo == null) continue;
                            Match(foreignPropertyInfo, foreignProperty, foreignModel, foreignProp);
                        }
                        prop.SetValue(model, foreignModel);
                    }
                }

                
            }
            Data.Add(model);
            
        }
    }

    

    private void Save()
    {
        throw new NotImplementedException();
    }
}
