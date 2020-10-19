<template>
  <AppLayout>
    <div class="bg-white shadow overflow-hidden sm:rounded-lg">
      <div class="px-4 py-5 border-b border-gray-200 sm:px-6 bg-green-500">
        <h3
          class="text-lg text-white font-bold leading-6 font-medium"
        >
          <font-awesome-icon icon="paper-plane"></font-awesome-icon>&nbsp;Transferencias
        </h3>
      </div>
      <div class="bg-gray-50 px-4 sm:px-6">
        <div class="flex flex-col">
          <div class="my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
            <div class="align-middle inline-block min-w-full">
              <div class="shadow overflow-hidden border-gray-200">
                <table class="min-w-full divide-y divide-gray-200">
                  <thead>
                    <tr>
                        <th class="font-bold px-6 py-3 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider">#</th>
                        <th class="font-bold px-6 py-3 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider">Monto</th>
                        <th class="font-bold px-6 py-3 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider">Tasa $</th>
                        <th class="font-bold px-6 py-3 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider">En Dolares</th>
                        <th class="font-bold px-6 py-3 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider">Fecha</th>
                        <th class="font-bold px-6 py-3 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider">Tipo</th>
                        <th class="font-bold px-6 py-3 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider"></th>
                    </tr>
                  </thead>
                  <tbody class="bg-white divide-y divide-gray-200">
                    <tr v-for="transfer in transfers.data" :key="transfer.id">
                        <td class="px-6 text-gray-700 py-4 whitespace-no-wrap">{{transfer.id}}</td>
                        <td class="px-6 text-gray-700 py-4 whitespace-no-wrap">
                            {{
                                parseFloat(transfer.amount).toLocaleString("us", {
                                    minimumFractionDigits: 2,
                                    maximumFractionDigits: 2,
                                })
                            }} Bs
                        </td>
                        <td class="px-6 text-gray-700 py-4 whitespace-no-wrap">
                            {{
                                parseFloat(transfer.rate).toLocaleString("us", {
                                    minimumFractionDigits: 2,
                                    maximumFractionDigits: 2,
                                })
                            }}Bs
                        </td>
                        <td class="px-6 text-gray-700 py-4 whitespace-no-wrap">
                            {{
                                parseFloat(transfer.in_dollars).toLocaleString("us", {
                                    minimumFractionDigits: 2,
                                    maximumFractionDigits: 2,
                                })
                            }} $
                        </td>
                        <td class="px-6 text-gray-700 py-4 whitespace-no-wrap">{{transfer.date}}</td>
                        <td class="px-6 text-gray-700 py-4 whitespace-no-wrap">
                            {{transfer.type_id ? transfer.type.name : 'Diezmos'}}
                        </td>
                        <td class="px-6 text-gray-700 py-4 whitespace-no-wrap">
                            <inertia-link :href="$route('transferencias.show', transfer.id)" class="bg-teal-600 hover:bg-teal-700 text-right text-white py-1 px-3 rounded-sm">
                                <font-awesome-icon icon="bullseye"></font-awesome-icon>
                            </inertia-link>
                            <button @click="destroy(transfer.id)" class="bg-red-500 hover:bg-red-600 text-right text-white py-1 px-3 rounded-sm">
                                <font-awesome-icon icon="times"></font-awesome-icon>
                            </button>
                        </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
      <pagination :links="transfers.links" :items="transfers"></pagination>
    </div>
  </AppLayout>
</template>

<script>
    import AppLayout from "../../Layouts/AppLayout";
    import Pagination from "../../components/Pagination";

    export default {
        props: ["transfers"],
        components: {
            AppLayout,
            Pagination
        },
        methods:{
            destroy(id){
                this.$swal.fire({
                    title: "Advertencia!",
                    text: "No podra revertir esta acción",
                    icon: "warning",
                    confirmButtonText: "Continuar",
                    showCancelButton: true,
                    cancelButtonText: "Cancelar",
                    })
                    .then((result) => {
                        if (result.value) {
                            this.$inertia.delete(route("transferencias.destroy", id));
                        }
                    });
            }
        }
    };
</script>
