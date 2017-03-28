/**
 * Created by Mingholy on 2017/3/27.
 */
'use strict';

const Hapi = require('hapi');
const Hoek = require('hoek');

const server = new Hapi.Server();

/**
 * Query tasks
 * @type {{stuinfo: string, avggrade: string, sortcourse: string, showcourse: string, creditsum: string}}
 */
const task = {
    stuinfo: 'SELECT student.stu_name AS "学生姓名", course.course_name AS "课程名称", course_selected.course_grade AS "课程成绩", course.course_credit AS "课程学分" FROM student, course, course_selected WHERE student.stu_id = course_selected.stu_id AND course.course_id = course_selected.course_id AND student.stu_name = ?',
    avggrade: 'SELECT course.course_name AS "课程名称", AVG(course_selected.course_grade) AS "平均成绩" FROM course, course_selected WHERE course.course_id = course_selected.course_id AND course.course_name = ?',
    sortcourse: 'SELECT course.course_name AS "课程名称", AVG(course_selected.course_grade) AS "平均成绩" FROM course, course_selected WHERE course.course_id = course_selected.course_id GROUP BY course.course_name ORDER BY "平均成绩" DESC ',
    showcourse: 'SELECT course.course_name AS "课程名称", professor.prof_name AS "教师姓名" FROM course, professor, prof_course WHERE course.course_id = prof_course.course_id AND professor.prof_id = prof_course.prof_id',
    creditsum: 'SELECT student.stu_name AS "学生姓名", SUM(course.course_credit) AS "学分总计" FROM student, course, course_selected WHERE student.stu_id = course_selected.stu_id AND course_selected.course_id = course.course_id AND student.stu_name = ?'
};


/**
 * Prepare server on localhost listening port 3100.
 */
server.connection({
    port: 3100,
    host: 'localhost'
});

/**
 * MySQL connection.
 */
server.register({
    register: require('hapi-plugin-mysql'),
    options: {
        host: "127.0.0.1",
        user: "root",
        password: "root",
        database: "course",
        port: "3306"
    }
}, function (err) {
    if (err) console.log(err);
});

/**
 * View engine options.
 */
server.register(require('vision'), (err) => {

    Hoek.assert(!err,err);

    server.views({
        engines: {
            jade: require('pug')
        },
        relativeTo: __dirname,
        path: 'templates',
        helpersPath: 'helpers'
    });
    /**
     * View handler function.
     */
    function queryHandler(request, reply, taskQuery) {
        let noResultError = [],
            emptyQueryError = [{'错误！': '查询为空！请输入需要查询的姓名或课程，如“李冰冰”、“范冰冰”，或者“通信工程”、“日语”等！'}];
        if (request.query.name === '') {
            reply.view('users', {
                ret: emptyQueryError
            });
            return;
        }
        request.app.db.query(taskQuery, request.query.name, function(err, result) {
            if (result.length === 0) {
                result = noResultError;
            } else if (!Object.values(result[0]).every((item) => {return item})) {
                result = noResultError;
            }
            reply.view('users', {
                ret: result
            });
        });
    }
    /**
     * Add route rules.
     */
    server.route({
        method: 'GET',
        path: '/',
        handler: function (request, reply) {
            reply.view('users', {
                ret: [{'简单介绍:': '后端是一个MySQL数据库，记录学生、课程、教师信息等。可以通过上面的表单查询相关内容。可以通过“各门课程平均成绩排序”查看有哪些课程；学生有张三李四王五等。'}]
            });
        }
    });

    server.route({
        method: 'GET',
        path: '/task1/stuinfo',
        handler: function (request, reply) {
            queryHandler(request, reply, task.stuinfo);
        }
    });

    server.route({
        method: 'GET',
        path: '/task1/creditsum',
        handler: function (request, reply) {
            queryHandler(request, reply, task.creditsum);
        }
    });

    server.route({
        method: 'GET',
        path: '/task2',
        handler: function (request, reply) {
            queryHandler(request, reply, task.avggrade);
        }
    });

    server.route({
        method: 'GET',
        path: '/task3',
        handler: function (request, reply) {
            queryHandler(request, reply, task.sortcourse);
        }
    });

    server.route({
        method: 'GET',
        path: '/task4',
        handler: function (request, reply) {
            queryHandler(request, reply, task.showcourse);
        }
    });
});

/**
 * Fix cannot find stylesheets problems.
 */
server.register(require('inert'), (err) => {

    if(err) {
        throw err;
    }

    server.route({
        method: 'GET',
        path: '/stylesheets/{filename}',
        handler: {
            directory: {
                path: 'public/stylesheets'
            }
        }
    })
});

/**
 * Start server.
 */
server.start((err) => {
    if(err) {
        throw err;
    }
    console.log('Server running at: $(server.info.uri}');
});
