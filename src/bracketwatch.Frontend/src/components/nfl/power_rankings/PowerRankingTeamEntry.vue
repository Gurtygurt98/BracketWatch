<template>
    <div class="rounded-lg shadow-md p-6 mb-12 bg-white">
        <h4 class="text-xl font-semibold text-white-900 mb-1">
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