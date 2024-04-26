import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

export class UserService {
    async createUser(user: any) {
        return await prisma.user.create({
            data: user
        });
    }

    async createStudent(student: any) {
        return await prisma.student.create({
            data: student
        });
    }

    async getUser(id: any) {
        return await prisma.user.findUnique(id);
    }

    async updateUser(updatedUser: any) {
        return prisma.user.update(updatedUser);
    }

}

export class SessionService {
    async createSession(session: any) {
        return prisma.session.create(session);
    }
}