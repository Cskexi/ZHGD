<template>
  <el-form :model="loginForm" :rules="fieldRules" ref="loginForm" label-position="left" label-width="0px"
    class="demo-ruleForm login-container">
    <h3 class="title">系统登录</h3>
    <el-form-item prop="account">
      账号<el-input type="text" v-model="loginForm.account" auto-complete="off" placeholder="账号"></el-input>
    </el-form-item>
    <el-form-item prop="password">
      密码<el-input type="password" v-model="loginForm.password" auto-complete="off" placeholder="密码"></el-input>
    </el-form-item>
    <el-form-item style="width:100%;">
      <el-button type="primary" style="" @click.native.prevent="login" :loading="logining">登 录</el-button>
      <!-- <el-button type="primary" style="width:48%;" @click="toRegister()">注 册</el-button> -->
    </el-form-item>
  </el-form>
</template>

<script>
import Cookies from "js-cookie"
import { login, getByToken } from "@/api/modules/user";
import { setStore } from '@/utils/storage'
export default {
  name: 'Login',
  data() {
    return {
      logining: false,
      loginForm: {
        account: '100016',
        password: '123456'
      },
      fieldRules: {
        account: [
          { required: true, message: '请输入账号', trigger: 'blur' },
        ],
        password: [
          { required: true, message: '请输入密码', trigger: 'blur' },
        ]
      },
      checked: true
    };
  },
  methods: {
    login() {
      login({
        ...this.loginForm
      }).then(result => {
        let token = result.data;
        setStore("token", token)
        setStore('user', this.loginForm.account)
        //this.loadUserData();
        console.log("token:" + result.data)
        console.log("user:" + this.loginForm.account)
        localStorage.setItem("user", JSON.stringify(this.loginForm.account))
        this.$message.success("成功登录")
        this.$router.push('/')  // 登录成功，跳转到主页
      }).catch(err => {
        console.log("error:" + err)
        this.$message.error(err)
      })
      //  let userInfo = {account:this.loginForm.account, password:this.loginForm.password}
      // // this.$api.login(JSON.stringify(userInfo)).then((res) => {
      // //     Cookies.set('token', res.data.token) // 放置token到Cookie
      // //     sessionStorage.setItem('user', userInfo.account) // 保存用户到本地会话

      // setStore('token', userInfo.token)
      // this.$router.push('/')  // 登录成功，跳转到主页
      //   }).catch(function(res) {
      //     alert(res);
      //   });
    },
    toRegister() {
      this.$router.push('/register')  // 登录成功，跳转到主页
    },
  }
}
</script>


<style lang="scss" scoped>
.login-container {
  -webkit-border-radius: 5px;
  border-radius: 5px;
  -moz-border-radius: 5px;
  background-clip: padding-box;
  margin: 180px auto;
  width: 350px;
  padding: 35px 35px 15px 35px;
  background: #fff;
  border: 1px solid #eaeaea;
  box-shadow: 0 0 25px #cac6c6;

  .title {
    margin: 0px auto 40px auto;
    text-align: center;
    color: #505458;
  }

  .remember {
    margin: 0px 0px 35px 0px;
  }
}
</style>