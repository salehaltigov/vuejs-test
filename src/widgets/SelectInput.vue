<template>
  <div>
    <label :for="label">{{ label }}</label>
    <select v-model="modelValue" @change="$emit('update:modelValue', modelValue)">
      <slot></slot>
    </select>
  </div>
</template>

<script>
export default {
  props: {
    modelValue: {
      type: String,
      required: true,
    },
    label: {
      type: String,
      required: true,
    },
  },
};
</script>

<style scoped>
select {
  width: 100%;
  padding: 8px;
}
</style>