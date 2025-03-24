<template>
  <div class="data-form">
    <h1>Форма назначения бригад</h1>
    <form @submit.prevent="submitForm">
      <label for="city">Город:</label>
      <select v-model="form.city" @change="updateShops">
        <option v-for="city in cities" :key="city.name" :value="city.name">{{ city.name }}</option>
      </select>

      <label for="shop">Цех:</label>
      <select v-model="form.shop" @change="updateEmployees">
        <option v-for="shop in shops" :key="shop.name" :value="shop.name">{{ shop.name }}</option>
      </select>

      <label for="employee">Сотрудник:</label>
      <select v-model="form.employee">
        <option v-for="employee in employees" :key="employee.name" :value="employee.name">{{ employee.name }}</option>
      </select>

      <label for="brigade">Бригада:</label>
      <select v-model="form.brigade">
        <option v-for="brigade in brigades" :key="brigade" :value="brigade">{{ brigade }}</option>
      </select>

      <label for="shift">Смена:</label>
      <select v-model="form.shift">
        <option v-for="shift in shifts" :key="shift" :value="shift">{{ shift }}</option>
      </select>

      <button type="submit">Сохранить</button>
    </form>
  </div>
</template>

<script>
import { useDataStore } from '../app/store';
import { City, Shop, Employee } from '../entities';

export default {
  data() {
    return {
      form: {
        city: '',
        shop: '',
        employee: '',
        brigade: '',
        shift: '',
      },
      cities: [
        new City('Москва'),
        new City('Санкт-Петербург'),
      ],
      shops: [],
      employees: [],
      brigades: ['Бригада 1', 'Бригада 2'],
      shifts: ['Дневная смена', 'Ночная смена'],
      cityShops: {
        'Москва': [
          new Shop('Московский основной цех', ['Иванов с основного цеха', 'Петров с основного цеха']),
          new Shop('Московский вспомогательный цех', ['Сидоров с вспомогательного цеха', 'Кузнецов с вспомогательного цеха']),
        ],
        'Санкт-Петербург': [
          new Shop('Питерский основной цех', ['Смирнов с основного цеха', 'Федоров с основного цеха']),
          new Shop('Питерский вспомогательный цех', ['Алексеев с вспомогательного цеха', 'Морозов с вспомогательного цеха']),
        ],
      },
    };
  },
  methods: {
    updateShops() {
      this.shops = this.cityShops[this.form.city] || [];
      this.form.shop = '';
      this.employees = [];
      this.form.employee = '';
    },
    updateEmployees() {
      const selectedShop = this.shops.find(shop => shop.name === this.form.shop);
      this .employees = selectedShop ? selectedShop.employees.map(emp => new Employee(emp)) : [];
      this.form.employee = '';
    },
    submitForm() {
      if (!this.form.city || !this.form.shop || !this.form.employee || !this.form.brigade || !this.form.shift) {
        alert('Пожалуйста, заполните все поля формы.');
        return;
      }

      const dataStore = useDataStore();
      dataStore.saveData(this.form);
      this.$router.push('/result');
    },
  },
};
</script>