<template>
    <div class="store-management">
      <h1>个人信息管理</h1>
      <p>账号：{{ user.account }}</p>
      <p>姓名:</p><el-input v-model="this.user.name" placeholder="请输入内容"></el-input>
      <p>性别</p>   
      <el-select  v-model="this.user.sexName">
            <el-option v-for="item in options" :key="item.value" :label="item.label" :value="item.value">
            </el-option>
        </el-select>
      <p>手机号</p><el-input v-model="this.user.telephone" placeholder="请输入内容"></el-input>
      <p>身份：{{ user.typeName }}</p>
      <p>密码修改</p>
  <el-button type="primary">提交</el-button>
    </div>
  </template>
    
  <script>
  import { getByToken } from "@/api/modules/user"
  import { getStore } from "@/utils/storage"
  export default {
    data() {
      return {
        user: {
        id: '',
        account: '',
        name: '',
        telephone: '',
        sex: '',
        password: '',
      },
      options: [{
        value: 1,
        label: '男'
      }, {
        value: 0,
        label: '女'
      },],
      }
    },
    mounted() {
        // let token = getStore("token")
        // console.log(token)
        this.loadUserData()
    },
    methods: {
    loadUserData() {
      let token = getStore("token")
      if (token) {
        console.log(token)
        getByToken({ token: token }).then(result => {
          this.user = this.setText(result.data);
          console.log(this.user)
        }).catch(err => {
          console.log("error:" + err)
        })
      }
      else {
        console.log("token为空")
      }
    },

    setText(item) {
        switch (item.type) {
          case '0':
            item.typeName = "管理员"
            break
          case '1':
            item.typeName = "施工人员"
            break
          case '2':
            item.typeName = "施工经理"
            break
          default:
            console.error("Unhandled type:", item.type);
        }
        switch (item.sex) {
          case '0':
            item.sexName = "女"
            break
          case '1':
            item.sexName = "男"
            break
          default:
            console.error("Unhandled sex:", item.type);
        }
        return item
      }

    },
  }
  
  </script>
    

  <style scoped>

  </style>