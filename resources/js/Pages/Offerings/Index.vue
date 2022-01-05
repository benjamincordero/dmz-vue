<template>
  <AppLayout>
    <div class="overflow-hidden bg-white shadow sm:rounded-lg">
      <div class="px-4 py-5 bg-teal-600 border-b border-gray-200 sm:px-6">
        <h3
          class="text-lg font-medium font-bold text-center text-white leading-6"
        >
          <font-awesome-icon icon="hand-holding-usd"></font-awesome-icon
          >&nbsp;Ofrendas Actuales
        </h3>
      </div>
      <div class="px-4 bg-gray-50 sm:px-6">
        <div class="flex flex-col">
          <div class="my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
            <div class="inline-block min-w-full align-middle">
              <div class="overflow-hidden border-gray-200 shadow">
                <table class="min-w-full divide-y divide-gray-200">
                  <thead>
                    <tr>
                      <th
                        class="px-6 py-3 text-xs font-medium font-bold tracking-wider text-left text-gray-500 uppercase bg-gray-50 leading-4"
                      >
                        Persona
                      </th>
                      <th
                        class="px-6 py-3 text-xs font-medium font-bold tracking-wider text-left text-gray-500 uppercase bg-gray-50 leading-4"
                      >
                        Monto
                      </th>

                      <th
                        class="px-6 py-3 text-xs font-medium font-bold tracking-wider text-left text-gray-500 uppercase bg-gray-50 leading-4"
                      >
                        Fecha
                      </th>
                      <th
                        class="px-6 py-3 text-xs font-medium font-bold tracking-wider text-left text-gray-500 uppercase bg-gray-50 leading-4"
                      >
                        Tipo
                      </th>
                      <th class="px-6 py-3 font-bold text-center bg-gray-50">
                        <inertia-link
                          :href="$route('ofrendas.create')"
                          class="px-3 py-1 text-white bg-blue-600 rounded-sm hover:bg-blue-700"
                        >
                          <font-awesome-icon icon="plus"></font-awesome-icon>
                        </inertia-link>
                      </th>
                    </tr>
                  </thead>
                  <tbody class="bg-white divide-y divide-gray-200">
                    <tr v-for="offering in offerings" :key="offering.id">
                      <td class="px-6 py-4 text-gray-700 whitespace-no-wrap">
                        {{ offering.person }}
                      </td>
                      <td class="px-6 py-4 text-gray-700 whitespace-no-wrap">
                        {{
                          parseFloat(offering.amount).toLocaleString("us", {
                            minimumFractionDigits: 2,
                            maximumFractionDigits: 2,
                          })
                        }}
                        {{ offering.currency }}
                      </td>

                      <td class="px-6 py-4 text-gray-700 whitespace-no-wrap">
                        {{ offering.date }}
                      </td>

                      <td class="px-6 py-4 text-gray-700 whitespace-no-wrap">
                        {{ offering.type.name }}
                      </td>
                      <td
                        class="px-6 py-4 text-center text-gray-700 whitespace-no-wrap"
                      >
                        <inertia-link
                          :href="$route('ofrendas.edit', offering.id)"
                          class="px-3 py-1 text-white bg-green-400 rounded-sm hover:bg-green-500"
                        >
                          <font-awesome-icon icon="pen"></font-awesome-icon>
                        </inertia-link>
                        <button
                          @click="deleteOffering(offering.id)"
                          class="px-3 py-1 text-right text-white bg-red-500 rounded-sm hover:bg-red-600"
                        >
                          <font-awesome-icon icon="times"></font-awesome-icon>
                        </button>
                      </td>
                    </tr>
                  </tbody>
                  <tfoot>
                    <td
                      class="px-6 py-4 font-bold text-gray-800 whitespace-no-wrap"
                    >
                      Total:
                    </td>
                    <td
                      class="px-6 py-4 font-bold text-gray-800 whitespace-no-wrap"
                    >
                      {{
                        parseFloat(total).toLocaleString("us", {
                          minimumFractionDigits: 2,
                          maximumFractionDigits: 2,
                        })
                      }}
                    </td>

                    <td
                      class="px-6 py-4 font-bold text-gray-800 whitespace-no-wrap"
                    >
                      <button
                        v-show="total > 0"
                        @click="openModalComplete"
                        class="px-3 py-1 text-right text-white bg-blue-600 rounded-sm hover:bg-blue-700"
                      >
                        <font-awesome-icon icon="check"></font-awesome-icon
                        >&nbsp; Completar
                      </button>
                    </td>
                    <td
                      class="px-6 py-4 font-bold text-gray-800 whitespace-no-wrap"
                    ></td>
                  </tfoot>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <dialog-modal
      :show="confirmingComplete"
      @close="confirmingComplete = false"
    >
      <template #title>
        <div class="text-center text-gray-600">
          <font-awesome-icon icon="check"></font-awesome-icon> Completar Ofrenda
        </div>
      </template>

      <template #content>
        <div class="flex justify-around">
          <div class="w-1/2 mt-4">
            <Input
              type="number"
              class="block w-full py-2 mr-1"
              placeholder="Taza del Dia"
              ref="rate"
              v-model="form.rate"
              @keyup.enter.native="complete"
            />
            <input-error :message="form.error('rate')" class="mt-2" />
          </div>
          <div class="w-1/2 mt-4">
            <select
              class="block w-full px-3 py-2 ml-1 leading-tight text-gray-700 bg-gray-200 border border-gray-200 rounded focus:outline-none focus:bg-white focus:border-gray-500"
              id="grid-state"
              name="type_id"
              v-model="form.type_id"
            >
              <option value="">Seleccione</option>
              <option value="1">Carpa</option>
              <option value="2">Imprenta</option>
            </select>
            <input-error :message="form.error('type_id')" class="mt-2" />
          </div>
        </div>
      </template>

      <template #footer>
        <div class="flex justify-around mt-4">
          <secondary-button @click.native="confirmingComplete = false">
            Cancelar
          </secondary-button>

          <Button
            @click.native="complete"
            class="text-white bg-blue-600 rounded-sm hover:bg-blue-700"
            :disabled="form.processing"
          >
            Continuar
          </Button>
        </div>
      </template>
    </dialog-modal>
  </AppLayout>
</template>

<script>
import AppLayout from "../../Layouts/AppLayout";
import DialogModal from "./../../components/DialogModal";
import Button from "./../../components/Button";

import Input from "./../../components/Input";

import InputError from "./../../components/InputError";

import SecondaryButton from "./../../components/SecondaryButton";

export default {
  props: ["offerings"],
  components: {
    AppLayout,
    DialogModal,
    Button,
    Input,
    InputError,
    SecondaryButton,
  },
  data() {
    return {
      form: this.$inertia.form({
        rate: "",
        type_id:''
      }),
      confirmingComplete: false,
    };
  },
  methods: {
    openModalComplete() {
      this.confirmingComplete = true;
      setTimeout(() => {
        this.$refs.rate.focus();
      }, 250);
    },
    async complete() {
        await this.$inertia.post(route("ofrendas.complete"), this.form);

        if (parseFloat(this.form.rate) > 0) {
            this.confirmingComplete = false;
        }

    },
    deleteOffering(id) {
      this.$swal
        .fire({
          title: "Advertencia!",
          text: "No podra revertir esta acción",
          icon: "warning",
          confirmButtonText: "Continuar",
          showCancelButton: true,
          cancelButtonText: "Cancelar",
        })
        .then((result) => {
          if (result.value) {
            this.$inertia.delete(route("ofrendas.destroy", id));
          }
        });
    },

  },
  computed: {
    total: function () {
      return this.offerings.reduce((i, current) => parseFloat(i) + parseFloat(current.amount), 0);
    },
  },
};
</script>
