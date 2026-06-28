import { Injectable, NotFoundException } from '@nestjs/common';
import { UserDto } from './users.dto';

@Injectable()
export class UserService {
    private users: UserDto[] = [];

    getAllUsers(): UserDto[]{
        return this.users;
    }

    getUserByID(id: string): UserDto{
        const foundUser = this.users.filter(u => u.id === id);

        if(foundUser.length){
            return this.users[id];
        }

        throw new NotFoundException("User with id ${id} not found");
    }

    createUser(user: UserDto): void{
        this.users.push(user);
    }

    updateUser(id: string, user: UserDto): UserDto{
        let userIndex = this.users.findIndex(u => u.id === id);
        if (userIndex >= 0){
            this.users[id] = user;
            return user;
        }

        throw new NotFoundException("Task with id ${id} not found");
    }
    
    deleteUser(id: string): void{
        let userIndex = this.users.findIndex(u => u.id === id);
        if (userIndex >= 0){
            this.users.splice(userIndex, 1);
        }

        throw new NotFoundException("Task with id ${id} not found");
    }
}
