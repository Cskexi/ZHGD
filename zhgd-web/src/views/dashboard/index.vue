<!-- src/components/MonitoringDashboard.vue -->
<template>
    <div class="monitoring-dashboard">
      <el-button type="primary" @click="addMonitor">新增</el-button>
      <el-row :gutter="20">

        <el-col :span="8" v-for="item in  equipmentData" :key="item.id">
          <el-card>
            <div class="monitoring-item">
              <h3>{{ item.name }}</h3>
              <p class="value">{{ item.value }}{{ item.flats }}</p>
            </div>
          </el-card>
        </el-col>

        <!-- <el-col :span="8" v-for="item in monitoringData" :key="item.title">
          <el-card>
            <div class="monitoring-item">
              <h3>{{ item.title }}</h3>
              <p class="value">{{ item.value }}</p>
            </div>
          </el-card>
        </el-col> -->
    
      </el-row>



      <addOrEdit v-if="visible" :defaultFormDate="obj" :title="title" :visible="visible" @close="closeFather"></addOrEdit>
    </div>
  </template>
  
  <script>
    import addOrEdit from "./components/AddOrEdit"
    import { list,dataChange } from "@/api/modules/equipment"
  export default {
    components: {
      addOrEdit
    },
    name: 'MonitoringDashboard',
    data() {
      return {
        visible: false,
        obj: {},
        form:{
          name:"",
          address:""
        },
        equipmentData:[],
        monitoringData: [
          { title: '温度', value: 25 },
          { title: '湿度', value: 60 },
          { title: '粉尘', value: 10 },
          { title: '噪音', value: 70 },
          { title: '空气质量', value: '优' },
          { title: '光照强度', value: 500 },
        ],
        timer: null,
      };
    },
    mounted() {
      this.timer = setInterval(() => this.fetchVideos(), 1000); // 每5秒更新一次数据
      this.fetchVideos()
    },
    beforeDestroy() {
      clearInterval(this.timer);
    },
    methods: {
      test(){
        
      console.log(1)

    },
      addMonitor() {
      this.title = "添加新监控"
      this.visible = true;
      this.obj={};
    },

      closeFather(val) {
      this.visible = false
      if(val){
        // this.fetchVideos();
      }
    },


    
    fetchVideos() {
        // 从后端获取视频数据，这里只是示例，实际情况需要根据后端API进行调整
        dataChange();
          list({...this.form}).then(result => {
          this.equipmentData = result.data;
          console.log(this.equipmentData)
        })
      },



      updateData() {
        // 这里应该替换为从API获取的实际数据
        this.monitoringData.forEach((item, index) => {
          if (item.title === '温度') {
            this.$set(this.monitoringData, index, { ...item, value: this.getRandomTemperature() });
          } else if (item.title === '湿度') {
            this.$set(this.monitoringData, index, { ...item, value: this.getRandomHumidity() });
          } else if (item.title === '粉尘') {
            this.$set(this.monitoringData, index, { ...item, value: this.getRandomDust() });
          } else if (item.title === '噪音') {
            this.$set(this.monitoringData, index, { ...item, value: this.getRandomNoise() });
          } else if (item.title === '空气质量') {
            const airQualities = ['优', '良', '轻度污染', '中度污染', '重度污染'];
            this.$set(this.monitoringData, index, { ...item, value: airQualities[Math.floor(Math.random() * airQualities.length)] });
          } else if (item.title === '光照强度') {
            this.$set(this.monitoringData, index, { ...item, value: this.getRandomIllumination() });
          } else if (item.title === '气象条件') {
            const weatherConditions = ['晴朗', '多云', '阴天', '小雨', '大雨', '雷阵雨'];
            this.$set(this.monitoringData, index, { ...item, value: weatherConditions[Math.floor(Math.random() * weatherConditions.length)] });
          }
        });
      },
      getRandomTemperature() {
        return Math.floor(Math.random() * 30) + 10; // 随机生成10-40度的温度值
      },
      getRandomHumidity() {
        return Math.floor(Math.random() * 50) + 10; // 随机生成10-60%的湿度值
      },
      getRandomDust() {
        return Math.floor(Math.random() * 20); // 随机生成0-20的粉尘值
      },
      getRandomNoise() {
        return Math.floor(Math.random() * 90) + 70; // 随机生成70-160分贝的噪音值
      },
      getRandomIllumination() {
        return Math.floor(Math.random() * 500); // 随机生成0-500的光照强度值
      },
    },
  };
  </script>
  
  <style scoped>
  .monitoring-dashboard {
    margin: 20px;
  }
  .monitoring-item {
    text-align: center;
  }
  .monitoring-item h3 {
    margin: 0;
    padding: 10px;
    background-color: #f5f7fa;
  }
  .monitoring-item .value {
    font-size: 24px;
    font-weight: bold;
    padding: 20px;
  }
  </style>