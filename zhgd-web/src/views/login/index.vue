<template>
    <div class="login-container">
        <el-form>
            <div class="title-container">
        <h3 class="title">Login Form</h3>
      </div>

      <el-form-item prop="username">
        <el-input/>
      </el-form-item>


        <el-form-item prop="password">
          <el-input/>
        </el-form-item>

      <el-button  type="primary">Login</el-button>

      <el-button  type="primary"> <router-link to="/dashboard">仪表盘</router-link></el-button>
      <el-button  type="primary"> <router-link to="/register">注册</router-link></el-button>
        </el-form>
    </div>
</template>

<script>
import { userList } from "@/api/modules/user"
export default{
  mounted(){
    this.loadUserData()
  },
  methods:{
    loadUserData() {
      userList()
        .then(result => {
          //this.UserData = result.data.records;
          // this.UserData = this.setText(result.data.records);
          // this.total = result.data.total;
          console.log(result)
          // console.log(this.UserData)
        }).catch(err => {
          console.log("error:" + err)
        })
    },
  }
}

</script>