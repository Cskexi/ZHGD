<template>
    <div class="site-wrapper">
      <h2>当前待处理消息</h2>

    </div>
  </template>
  
  <script>

import {  list,save } from "@/api/modules/notice"
  export default {
    name: 'home',
  }
  </script>

  <style lang="scss">
  .site-wrapper em{
    color: red;
  }
    </style>