using System.ComponentModel.DataAnnotations.Schema;

namespace Backend.Models;

public class User : ModelBase
{
    public string name { get; set; }
    public string icon { get; set; }
    public bool isCloseFriend { get; set; }
    public bool haveStory { get; set; }

}

public class Me : User
{
    // public string[] story { get; set; }

    [ForeignKey("id")]
    public User[] followed { get; set; }
}

public class UserComment : ModelBase 
{
    [ForeignKey("id")]
    public User user { get; set; }

    [ForeignKey("id")]
    public Post post { get; set; }

    public string value { get; set; }
    public string type { get; set; }
    public string date { get; set; }

}

public class Post : ModelBase 
{
    [ForeignKey("id")]
    public User author { get; set; }
    public string[] image { get; set; }
    public string text { get; set; }
    
    [ForeignKey("id")]
    public User[] likes { get; set; }

    [ForeignKey("id")]
    public UserComment[] comments { get; set; }

    public String date { get; set; }
}

