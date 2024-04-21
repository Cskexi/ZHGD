<template>
    <section class="app-main">
        页面渲染
          <router-view/>
    </section>
  </template>
  
  <script>
  export default {
    name: 'AppMain',
    computed: {
    }
  }
  </script>
  
  <style lang="scss" scoped>
  .app-main {
    width: 100%;
    position: relative;
    overflow: hidden;
  }
  </style>
  
