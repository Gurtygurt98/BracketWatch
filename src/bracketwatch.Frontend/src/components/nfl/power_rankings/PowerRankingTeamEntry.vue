<template>
    <div class="bg-white rounded-lg shadow-md p-6 mb-4 bg-gradient-to-r from-black-200 via-gray-100 to-yellow-200">
        <h4 class="text-xl font-semibold text-yellow-900 mb-1">
            {{ props.RankEntry.rank }}
        </h4>
        <h4 class="text-xl font-semibold text-gray-900 mb-1">
            {{ props.RankEntry.team.name }}
        </h4>
    </div>
</template>

<script setup lang="ts">
    import type { PowerRankingDto } from '@/models/PowerRankingDto';
    interface Props {
        RankEntry : PowerRankingDto
    }
    const props = defineProps<Props>()

</script>