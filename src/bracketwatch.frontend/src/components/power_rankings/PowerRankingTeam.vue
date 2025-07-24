<template>
  <div>
    <button @click="onLoad">Load Rankings</button>
    <ul>
      <li v-for="r in rankings" :key="r.rank">
        {{ r.team.name }} <!-- your DTO has team.name -->
      </li>
    </ul>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue';
import { loadPowerRankings } from '@/services/powerRankingServices';

import type { PowerRankingDto } from '@/models/ApiClient';

const rankings = ref<PowerRankingDto[]>([]);

async function onLoad() {
  rankings.value = await loadPowerRankings();
}
</script>
