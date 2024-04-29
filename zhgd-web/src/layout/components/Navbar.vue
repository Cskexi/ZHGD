<template>
    <div>
    导航栏
    <el-button type="primary" @click="logOut()">登 出</el-button>
    </div>
  </template>
  
  <script>
  import { removeStore } from '@/utils/storage'
  export default {
    data() {
      return {
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
