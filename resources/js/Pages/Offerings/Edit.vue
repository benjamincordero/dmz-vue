<template>
  <AppLayout>
    <div class="bg-white shadow overflow-hidden sm:rounded-lg">
      <div class="text-center px-4 py-5 border-b border-gray-200 sm:px-6 bg-teal-600">
        <h3 class="text-white  text-lg leading-6 font-medium ">
          <font-awesome-icon icon="hand-holding-usd"></font-awesome-icon>&nbsp;Editar Ofrendas
        </h3>
      </div>
        <div class="bg-gray-50 px-4 py-2 sm:px-6">
            <form @submit.prevent="submit">
                <Form :form="form"/>
                <div class="px-4 py-2 border-t border-gray-200 sm:px-6 text-right">
                    <button type="submit" class="py-2 px-4 bg-green-500 hover:bg-green-600 text-white rounded-sm">
                        <font-awesome-icon icon="sync-alt"></font-awesome-icon>&nbsp; Actualizar
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
        props:['offering'],
        components: {
            AppLayout,
            Form,
        },
        data() {
            return {
                form:this.$inertia.form({
                    person:this.offering.person,
                    amount:this.offering.amount,
                    currency:this.offering.currency,
                    type_id:this.offering.type_id
                }),
            };
        },
        methods:{
            submit(){
                this.$inertia.put(route('ofrendas.update', this.offering.id), this.form);
            }
        }
    };
</script>
