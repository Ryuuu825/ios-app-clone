namespace Backend.Models;

public class User : ModelBase
{
    public string Name { get; set; }
    public string Email { get; set; }

    public List<User> Data() {
        return new List<User>{
            new User { Id = 1, Name = "John Doe", Email = "ds" },
            new User { Id = 2, Name = "Jane Doe", Email = "ds" },
        };
    }
}