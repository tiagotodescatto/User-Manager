import { Body, Controller, Delete, Get, Param, Patch, Post } from '@nestjs/common';
import { AppService } from './users.service';
import { UserDto } from './user.dto';

@Controller('users')
export class AppController {
  constructor(private readonly appService: AppService) {}

  // GET /users/
  @Get()
  getAllUsers(){

  }

  // GET /users/:id
  @Get(':id')
  getByID(@Param('id') id: string){

  }

  // POST /users/
  @Post()
  createUser(@Body() body: UserDto){
    
  }
  
  // PATCH /users/:id
  @Patch(':id')
  updateUser(@Param('id') id: string, @Body() body: UserDto){

  }

  // DELETE /users/:id
  @Delete(':id')
  deleteUser(@Param('id') id: string){

  }
}
