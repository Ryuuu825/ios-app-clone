using Backend.Models;
using Microsoft.AspNetCore.Mvc;

namespace Backend.Controllers;

public class UserController : APIControllerBase<User> {}
public class MeController : APIControllerBase<Me> {}
public class UserCommentController : APIControllerBase<UserComment> {}
public class PostController : APIControllerBase<Post> {}
