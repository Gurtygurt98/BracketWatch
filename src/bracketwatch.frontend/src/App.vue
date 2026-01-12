<script setup lang="ts">
  import  PlayoffPictureVue from './components/nfl/playoff_picture/PlayoffPicture.vue';

</script>
<template>
  <main class="min-h-dvh bg-gray-900">
    <div
      class="flex flex-col justify-center
             pt-4 sm:pt-10
             items-center
             gap-6 sm:gap-10 lg:gap-14
             px-1 sm:px-4 pb-1"
    >
        <PlayoffPictureVue conference="afc" class="w-full max-w-5xl" />

        <PlayoffPictureVue conference="nfc" class="w-full max-w-5xl" />
    </div>
    <footer class="text-center text-gray-500 text-sm py-4">
      &copy; 2026 BracketWatch. All rights reserved. BracketWatch 
    </footer>
  </main>
</template>