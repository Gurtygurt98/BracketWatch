import { defineConfig } from 'vite';
import plugin from '@vitejs/plugin-vue';

// https://vitejs.dev/config/
export default defineConfig({
    plugins: [plugin()],
    server: {
      port: 54582,
      proxy: {
        '/api': 'http://localhost:3951'
      }
    }
})
