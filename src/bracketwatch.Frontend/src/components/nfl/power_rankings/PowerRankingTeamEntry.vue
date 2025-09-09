<template>
    <div class="bg-white rounded-lg shadow-md p-6 mb-4">
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