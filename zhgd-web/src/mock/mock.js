import Mock from 'mockjs'; // es6语法引l入mock
Mock.mock('http://localhost:8080/login',{
    data:{
        'token':'43333333',//随机生成姓名
    }
    });

Mock.mock('http://localhost:8080/user',{
    'name':'@name',//随机生成姓名
    'email':'@email',//随机生成姓名
    'age|1-10': 5//其他数据
    });
Mock.mock('http://localhost:8080/menu', {
    'id':'@increment',//随机生成姓名
    'name': 'menu',
    'order|10-20': 12//其他数据
    });