<script setup lang="ts">
  import  PlayoffPictureVue from './components/nfl/playoff_picture/PlayoffPicture.vue';

</script>
<template>
  <main class="min-h-dvh bg-gray-900">
    <div class="pt-4 sm:pt-10 grid grid-cols-2 lg:flex lg:flex-row items-start justify-center gap-1 sm:gap-4 lg:gap-6 px-1 sm:px-4">
      <PlayoffPictureVue conference="afc" class="w-full" />
      <PlayoffPictureVue conference="nfc" class="w-full" />
    </div>
  </main>
</template>