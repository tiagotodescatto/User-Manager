import { Body, Controller, Delete, Get, Param, Patch, Post } from '@nestjs/common';
import { UserService } from './users.service';
import { UserDto } from './users.dto';

@Controller('users')
export class UserController {
  constructor(private readonly userService: UserService) {}

  // GET /users/
  @Get()
  getAllUsers(){
    return this.userService.getAllUsers();
  }

  // GET /users/:id
  @Get(':id')
  getUserByID(@Param('id') id: string){
    return this.userService.getUserByID(id);
  }

  // POST /users/
  @Post()
  createUser(@Body() user: UserDto){
    return this.userService.createUser(user);
  }
  
  // PATCH /users/:id
  @Patch(':id')
  updateUser(@Param('id') id: string, @Body() user: UserDto){
    return this.userService.updateUser(id, user);
  }

  // DELETE /users/:id
  @Delete(':id')
  deleteUser(@Param('id') id: string){
    return this.userService.deleteUser(id);
  }
}
