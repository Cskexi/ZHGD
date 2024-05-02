<template>
    <div class="store-management">
      <h1>个人信息管理</h1>
      <p>账号：{{ user.account }}</p>
      <p>姓名：{{user.name}}</p>
      <p>性别：{{ user.sexName }}</p>   
      <p>手机号：{{user.telephone  }}</p>
      <p>身份：{{ user.typeName }}</p>
  <el-button type="primary" @click="edit">修改</el-button>
  <addOrEdit v-if="visible" :defaultFormDate="obj" :title="title" :visible="visible" @close="closeFather"></addOrEdit>
    </div>
  </template>
    
  <script>
  import { getByToken,update } from "@/api/modules/user"
  import { getStore } from "@/utils/storage"
  import addOrEdit from "./AddOrEdit"
  export default {
    components: { addOrEdit },
    data() {
      return {
        visible: false,
      obj: {},
      title: "修改",
        user: {
        id: '',
        account: '',
        name: '',
        telephone: '',
        sex: '',
        password: '',
      },
      }
    },
    mounted() {
        this.loadUserData()
        
    },
    methods: {
    edit() {
      this.obj = this.user;
      this.title = "编辑个人信息"
      this.visible = true;
    },
    closeFather(val) {
      this.visible = false
      if (val) {
        this.loadUserData()
      }
    },

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