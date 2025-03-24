<template>
  <div>
    <h1>Список назначенных бригад</h1>
    <p>Город: {{ data.city }}</p>
    <p>Цех: {{ data.shop }}</p>
    <p>Сотрудник: {{ data.employee }}</p>
    <p>Бригада: {{ data.brigade }}</p>
    <p>Смена: {{ data.shift }}</p>
    <router-link to="/">Назад</router-link>
  </div>
</template>

<script>
import { useDataStore } from '../app/store';

export default {
  setup() {
    const dataStore = useDataStore();
    return { data: dataStore };
  },
};
</script>