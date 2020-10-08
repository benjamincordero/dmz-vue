<template>
  <AppLayout>
    <div class="max-w-7xl mx-auto py-2 sm:px-6 lg:px-8">
      <h1 class="text-center text-3xl">Crear Categoria</h1>
    </div>
    <div class="flex mx-auto align-middle block bg-white p-6 w-full lg:w-1/2 shadow overflow-hidden sm:rounded-lg border-b border-gray-200">

        <form @submit.prevent="submit" class="w-full">
            <label for="name" class="w-full display-block">Categoria:</label>
            <input type="text" class="w-full form-input display-block" v-model="form.name" name="name" placeholder="Categoria"/>
                <input-error :message="form.error('name')" class="mt-2" />
            <div class="text-right w-full">
                <button type="submit" class="text-white bg-indigo-500 p-2 hover:bg-indigo-700 mt-2 rounded">Guardar</button>
            </div>
        </form>

    </div>
  </AppLayout>
</template>

<script>
import AppLayout from "../../../Layouts/AppLayout";
import InputError from '../../../components/InputError'

export default {
  props: ['url'],
  components: {
    AppLayout,
    InputError
  },
  data(){
      return {
          form:this.$inertia.form({
            name:'',
          })
      }
  },
  methods:{
      submit(){
          this.$inertia.post(this.url, this.form);
      }
  }
};
</script>
