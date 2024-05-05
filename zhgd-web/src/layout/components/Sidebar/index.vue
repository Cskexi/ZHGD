<template>
<el-menu :default-openeds="['1', '2']">
  <el-menu-item index="1">
            <router-link to="/dashboard">首页</router-link>
    </el-menu-item>
    <el-menu-item index="1">
            <router-link to="/dashboard">信息中心</router-link>
    </el-menu-item>
    <el-menu-item index="1">
            <router-link to="/permission">用户管理</router-link>
    </el-menu-item>
    <el-menu-item index="1">
            <router-link to="/dashboard">现场监控</router-link>
    </el-menu-item>
    <el-menu-item index="1">
            <router-link to="/userInfo">个人信息管理</router-link>
    </el-menu-item>
      <el-submenu index="1">
        <template slot="title">考勤管理</template>
        <el-menu-item-group>
          <el-menu-item index="1-1"> <router-link to="/attendance">出勤人员统计</router-link></el-menu-item>
          <el-menu-item index="1-1"><router-link to="/attendanceApply">请假申请</router-link></el-menu-item>
          <el-menu-item index="1-2"><router-link to="/attendanceVet">请假单审核</router-link></el-menu-item>
          <el-menu-item index="1-2"><router-link to="/myAttendance">我的申请</router-link></el-menu-item>
        </el-menu-item-group>
      </el-submenu>
      <el-submenu index="2">
        <template slot="title">项目任务管理</template>
        <el-menu-item-group>
          <el-menu-item index="2-1">项目管理</el-menu-item>
          <el-menu-item index="2-2">任务管理</el-menu-item>
        </el-menu-item-group>
      </el-submenu>
    </el-menu>
  </template>

  <script>


export default{
   
}
</script>
