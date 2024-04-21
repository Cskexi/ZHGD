<template>
    <div>
        <el-menu class="el-menu-vertical-demo" default-active="1">
          
        <el-menu-item index="1">
            <router-link to="/dashboard">仪表盘</router-link>
          </el-menu-item>
            <el-menu-item index="2">
            <router-link to="/task/index">任务管理</router-link>
          </el-menu-item>

        </el-menu>
    </div>
  </template>

  <script>


export default{
   
}
</script>
