<template>
    <div class="app-wrapper">
        <sidebar class="sidebar-container"/>
        <div class="main-container">
          <navbar/>
          布局
          <app-main/>
        </div>    
    </div>
</template>

<script>
import  {AppMain,Sidebar,Navbar}  from './components'

export default {
    name: 'Layout',
    components: {
    AppMain,
    Sidebar,
    Navbar,
  },
}

</script>

<style lang="scss" scoped>

  .app-wrapper {
    position: relative;
    height: 100%;
    width: 100%;
  }

</style>