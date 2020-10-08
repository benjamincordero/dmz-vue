<template>
  <AppLayout>
    <div class="max-w-7xl mx-auto py-2 sm:px-6 lg:px-8">
      <h1 class="text-center text-3xl">Editar Categoria</h1>
    </div>
    <div class="flex mx-auto align-middle block bg-white p-6 w-full lg:w-1/2 shadow overflow-hidden sm:rounded-lg border-b border-gray-200">
        <form @submit.prevent="submit" class="w-full">
            <label for="name" class="w-full display-block">Categoria:</label>
            <input type="text" class="w-full form-input display-block" v-model="form.name" name="name" placeholder="Categoria"/>
            <div class="text-right w-full">
                <button type="submit" class="text-white bg-green-500 p-2 hover:bg-green-700 mt-2 rounded">Actualizar</button>
            </div>
        </form>

    </div>
  </AppLayout>
</template>

<script>
import AppLayout from "../../../Layouts/AppLayout";
export default {
  props: ["category", 'url'],
  components: {
    AppLayout,
  },
  data(){
      return {
          form:this.$inertia.form({
            '_method': 'PUT',
            name: this.category.name,
          })

      }
  },
  methods:{
      submit(){
          this.$inertia.put(this.url, this.category);
      }
  }
};
</script>
