const USER_ID = 1;
const route = require('express').Router();
const { Tasks } = require('../repository/tasks');

route.get(['/', '/index'], async  (req, res) => {
  const tasks = new Tasks();
  const data = await tasks.getTasks(USER_ID);
  res.render('todo/index', { tasks: data });
});

route.get('/create', (req, res) => {
  res.render('todo/create');
});

route.post('/create', async (req, res) => {
  const tasks = new Tasks();
  await tasks.createTask(USER_ID, req.body);
  res.redirect('/todo');
});

route.post('/delete/:taskId', async (req, res) => {
  const tasks = new Tasks();
  await tasks.deleteTask(req.params.taskId);
  res.redirect('/todo');
});

route.get('/edit/:taskId', async (req, res) => {
  const tasks = new Tasks();
  const data = await tasks.getTask(req.params.taskId);
  res.render('todo/edit', { item: data });
});

route.post('/edit/:taskId', async (req, res) => {
  const tasks = new Tasks();
  await tasks.updateTask(req.params.taskId, req.body);
  res.redirect('/todo');
});

module.exports = route;