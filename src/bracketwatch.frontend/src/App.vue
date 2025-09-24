<script setup lang="ts">
import PowerRankingList from './components/nfl/power_rankings/PowerRankingList.vue'
import logo from '@/assets/logo.svg'
</script>

<template>
  <main class="bg-blue-500 bg-blend-multiply" :style="{ backgroundImage: `url(${logo})` }">
    <PowerRankingList />
  </main>
</template>
