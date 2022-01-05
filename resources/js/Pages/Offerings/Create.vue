<template>
  <AppLayout>
    <div class="overflow-hidden bg-white shadow sm:rounded-lg">
      <div class="px-4 py-5 bg-teal-600 border-b border-gray-200 sm:px-6">
        <h3 class="text-lg font-medium text-white leading-6">
          <font-awesome-icon icon="hand-holding-usd"></font-awesome-icon>&nbsp;Añadir
          Ofrenda
        </h3>
      </div>
        <div class="px-4 py-2 bg-gray-50 sm:px-6">
            <form @submit.prevent="submit">
                <Form :form="form"/>
                <div class="px-4 py-2 text-right border-t border-gray-200 sm:px-6">
                    <button type="submit" class="px-4 py-2 text-white bg-indigo-600 rounded hover:bg-indigo-400">
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
                    currency:'',
                    type_id:1
                }),
            };
        },
        methods:{
            submit(){

                this.$inertia.post(route('ofrendas.store'), this.form);
            }
        }
    };
</script>
