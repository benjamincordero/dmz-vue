<template>
  <AppLayout>
    <div class="bg-white shadow overflow-hidden sm:rounded-lg">
      <div class="px-4 py-5 border-b border-gray-200 sm:px-6 bg-teal-600">
        <h3
          class="text-lg text-white text-center font-bold leading-6 font-medium"
        >
          <font-awesome-icon icon="paper-plane"></font-awesome-icon
          >&nbsp;Transferencia #{{ details[0].transfer.id }} - Detalles
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
                      <th
                        class="font-bold px-6 py-3 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider"
                      >
                        Persona
                      </th>
                      <th
                        class="font-bold px-6 py-3 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider"
                      >
                        Monto
                      </th>
                      <th
                        class="font-bold px-6 py-3 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider"
                      >
                        Fecha
                      </th>
                      <th
                        class="font-bold px-6 py-3 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider"
                      >
                        Tipo
                      </th>
                    </tr>
                  </thead>
                  <tbody class="bg-white divide-y divide-gray-200">
                    <tr v-for="detail in details" :key="detail.id">
                      <td class="px-6 text-gray-700 py-4 whitespace-no-wrap">
                        {{ detail.person }}
                      </td>
                      <td class="px-6 text-gray-700 py-4 whitespace-no-wrap">
                        {{
                          parseFloat(detail.amount).toLocaleString("us", {
                            minimumFractionDigits: 2,
                            maximumFractionDigits: 2,
                          })
                        }}
                        {{ detail.currency }}
                      </td>

                      <td class="px-6 text-gray-700 py-4 whitespace-no-wrap">
                        {{ detail.date }}
                      </td>
                      <td class="px-6 text-gray-700 py-4 whitespace-no-wrap">
                        {{detail.type_id ? detail.type.name : 'Diezmos'}}
                      </td>
                    </tr>
                  </tbody>
                  <tfoot>
                    <td
                      class="px-6 font-bold text-gray-800 py-4 whitespace-no-wrap"
                    >
                      Totales:
                    </td>
                    <td
                      class="px-6 font-bold text-gray-800 py-4 whitespace-no-wrap"
                    >
                      {{
                        parseFloat(total).toLocaleString("us", {
                          minimumFractionDigits: 2,
                          maximumFractionDigits: 2,
                        })
                      }}
                    </td>
                    <td
                      class="px-6 font-bold text-gray-800 py-4 whitespace-no-wrap"
                    >

                    </td>
                    <td
                      class="px-6 font-bold text-gray-800 py-4 whitespace-no-wrap"
                    ></td>
                  </tfoot>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </AppLayout>
</template>

<script>
import AppLayout from "../../Layouts/AppLayout";

export default {
  props: ["details"],
  components: {
    AppLayout,
  },
   computed: {
    total: function () {
      return this.details.reduce((i, current) => i + current.amount, 0);
    },

  },
};
</script>
