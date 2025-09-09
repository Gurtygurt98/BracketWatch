
<template>
  <div class="max-w-4xl mx-auto rounded-xl shadow-lg bg- px-2 py-2">
    <div v-for="r in rankings" :key="r.rank" >
      <PowerRankingTeamEntry :RankEntry="r" />
    </div>
  </div>

</template>


<script setup lang="ts">
    import { ref, onMounted } from 'vue';
    import { loadPowerRankings } from '@/services/powerRankingServices';
    import PowerRankingTeamEntry from '@/components/nfl/power_rankings/PowerRankingTeamEntry.vue';
    import type { PowerRankingDto } from '@/models/PowerRankingDto';

    const rankings = ref<PowerRankingDto[]>([]);

    async function onLoad() {
        try {
            console.log('Loading rankings...');
            rankings.value = await loadPowerRankings();
            console.log('Loaded rankings:', rankings.value);
        } catch (error) {
            console.error('Error loading rankings:', error);
        }
    }
    onMounted(() => {
      onLoad();
    });
</script>