<template>
    
    <div style="margin-top: 10px; float:right; ">
      <span style="margin-right: 10px;">{{user}}</span>
      <el-button type="primary" @click="logOut()" >登 出</el-button>
    </div>
    
  </template>
  
  <script>
  import { removeStore } from '@/utils/storage'
  export default {
    data() {
      return {
        user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {}
      };
    },
    methods: {
      logOut() {
        removeStore('user')
        this.$router.push('/login')  // 登录成功，跳转到主页
      },
    }
  }
</script>
