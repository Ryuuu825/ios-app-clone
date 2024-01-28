namespace Backend.Controllers;

using Microsoft.AspNetCore.Mvc;

using Backend.Models;

[ApiController]
[Route("api/[controller]")]
public class APIControllerBase<T> : ControllerBase  
    where T : ModelBase, new()
{
    public List<T> Data { get; set; } = new List<T> { };

    public APIControllerBase()
    {
        // Get the runtime type of the T, it may not ModelBase, but a derived class
        var type = typeof(T);
        // Create an instance of the type
        var instance = (T)Activator.CreateInstance(type)!;
        // Call the Data method using reflection
        var method = type.GetMethod("Data");
        // Cast the result to a List<T>
        Data = (List<T>)method!.Invoke(instance, null)!;
        
    }

    [HttpGet]
    public IEnumerable<T> Get()
    {
        return Data.Cast<T>();
    }

    [HttpGet("{id}")]
    public T Get(int id)
    {
        return Data.Find(x => x.Id == id);
    }

    [HttpPost]
    public void Post([FromBody] T value)
    {
        Data.Add(value);
    }

    [HttpPut("{id}")]
    public void Put(int id, [FromBody] T value)
    {
        var index = Data.FindIndex(x => x.Id == id);
        Data[index] = value;
    }
}
