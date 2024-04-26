import { UserService, SessionService } from './services/services';
const express = require('express');
const app = express();
const bodyParser = require('body-parser')

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())

app.get('/user/read/:id', (req: any, res: any) => {
    new UserService().getUser(req.params.id)
        .then(data => {
            res.json(data);
        }).catch(err => {
            console.log("Error ", err.message);
        });
});

app.get('/user/read', (req: any, res: any) => {
    
});

app.post('/student/create', (req: any, res: any) => {
    const userService = new UserService();
    userService.createUser(req.body.user)
        .then(data => {
            // now we need to update the user and put the student info
            const student = req.body.student;
            student.userId = data.id;
            userService.createStudent(student)
                .then(data => res.status(200).send('OK'))
                .catch(err => console.log('could not create student'))
        })
        .catch(err => console.log(err));
});

app.post('/session/create', (req: any, res: any) => {
    const sessionService = new SessionService();
    sessionService.createSession(req.body)
        .then((data) => {
            // update
        })
        .catch(err => console.log(err))
});

app.listen(3000);
