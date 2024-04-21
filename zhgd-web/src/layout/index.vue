<template>
    <div class="app-wrapper">
        <sidebar class="sidebar-container"/>
        <div class="main-container">布局<app-main/></div>    
    </div>
</template>

<script>
import  {AppMain,Sidebar}  from './components'

export default {
    name: 'Layout',
    components: {
    AppMain,
    Sidebar,
  },
}

</script>



<style lang="scss" scoped>
  @import "~@/styles/mixin.scss";
  @import "~@/styles/variables.scss";

  .app-wrapper {
    @include clearfix;
    position: relative;
    height: 100%;
    width: 100%;
  }

</style>