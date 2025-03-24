import { defineStore } from 'pinia';

export const useDataStore = defineStore('data', {
  state: () => ({
    city: '',
    shop: '',
    employee: '',
    brigade: '',
    shift: '',
  }),
  actions: {
    saveData(data) {
      this.city = data.city;
      this.shop = data.shop;
      this.employee = data.employee;
      this.brigade = data.brigade;
      this.shift = data.shift;
    },
  },
});