<template>
  <AppLayout>
    <div class="bg-white shadow overflow-hidden sm:rounded-lg">
      <div class="px-4 py-5 border-b border-gray-200 sm:px-6">
        <h3 class="text-lg leading-6 font-medium text-gray-600">
          <font-awesome-icon icon="user-plus"></font-awesome-icon>&nbsp;Añadir
          Diezmo
        </h3>
      </div>
        <div class="bg-gray-50 px-4 py-2 sm:px-6">
            <form @submit.prevent="submit">
                <Form :form="form"/>
                <div class="px-4 py-2 border-t border-gray-200 sm:px-6 text-right">
                    <button type="submit" class="py-2 px-4 bg-indigo-600 hover:bg-indigo-400 text-white rounded">
                        <font-awesome-icon icon="check"></font-awesome-icon>&nbsp; Guardar
                    </button>
                </div>
            </form>


        </div>
    </div>
  </AppLayout>
</template>

<script>
    import AppLayout from "../../Layouts/AppLayout";
    import Form from './Form';

    export default {
        components: {
            AppLayout,
            Form,
        },
        data() {
            return {
                form:this.$inertia.form({
                    person:'',
                    amount:0,
                    currency:''
                }),
            };
        },
        methods:{
            submit(){
                this.$inertia.post(route('diezmos.store'), this.form);
            }
        }
    };
</script>
