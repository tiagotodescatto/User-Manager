import { Controller, Delete, Get, Patch, Post } from '@nestjs/common';
import { AppService } from './users.service';

@Controller('users')
export class AppController {
  constructor(private readonly appService: AppService) {}

  // GET /users/
  @Get()
  getAllUsers(){

  }

  // GET /users/:id
  @Get(':id')
  getByID(){

  }

  // POST /users/
  @Post()
  createUser(){

  }
  
  // PATCH /users/:id
  @Patch(':id')
  updateUser(){

  }

  // DELETE /users/:id
  @Delete(':id')
  deleteUser(){

  }
}
