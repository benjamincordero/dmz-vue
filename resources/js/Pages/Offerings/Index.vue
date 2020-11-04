<template>
  <AppLayout>
    <div class="bg-white shadow overflow-hidden sm:rounded-lg">
      <div class="px-4 py-5 border-b border-gray-200 sm:px-6 bg-teal-600">
        <h3
          class="text-lg text-white text-center font-bold leading-6 font-medium"
        >
          <font-awesome-icon icon="hand-holding-usd"></font-awesome-icon
          >&nbsp;Ofrendas Actuales
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
                      <th class="font-bold px-6 py-3 bg-gray-50 text-center">
                        <inertia-link
                          :href="$route('ofrendas.create')"
                          class="bg-blue-600 hover:bg-blue-700 text-white py-1 px-3 rounded-sm"
                        >
                          <font-awesome-icon icon="plus"></font-awesome-icon>
                        </inertia-link>
                      </th>
                    </tr>
                  </thead>
                  <tbody class="bg-white divide-y divide-gray-200">
                    <tr v-for="offering in offerings" :key="offering.id">
                      <td class="px-6 text-gray-700 py-4 whitespace-no-wrap">
                        {{ offering.person }}
                      </td>
                      <td class="px-6 text-gray-700 py-4 whitespace-no-wrap">
                        {{
                          parseFloat(offering.amount).toLocaleString("us", {
                            minimumFractionDigits: 2,
                            maximumFractionDigits: 2,
                          })
                        }}
                        {{ offering.currency }}
                      </td>

                      <td class="px-6 text-gray-700 py-4 whitespace-no-wrap">
                        {{ offering.date }}
                      </td>

                      <td class="px-6 text-gray-700 py-4 whitespace-no-wrap">
                        {{ offering.type.name }}
                      </td>
                      <td
                        class="px-6 text-gray-700 py-4 whitespace-no-wrap text-center"
                      >
                        <inertia-link
                          :href="$route('ofrendas.edit', offering.id)"
                          class="bg-green-400 hover:bg-green-500 text-white py-1 px-3 rounded-sm"
                        >
                          <font-awesome-icon icon="pen"></font-awesome-icon>
                        </inertia-link>
                        <button
                          @click="deleteOffering(offering.id)"
                          class="bg-red-500 hover:bg-red-600 text-right text-white py-1 px-3 rounded-sm"
                        >
                          <font-awesome-icon icon="times"></font-awesome-icon>
                        </button>
                      </td>
                    </tr>
                  </tbody>
                  <tfoot>
                    <td
                      class="px-6 font-bold text-gray-800 py-4 whitespace-no-wrap"
                    >
                      Total:
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
                      <button
                        v-show="total > 0"
                        @click="openModalComplete"
                        class="bg-blue-600 hover:bg-blue-700 text-right text-white py-1 px-3 rounded-sm"
                      >
                        <font-awesome-icon icon="check"></font-awesome-icon
                        >&nbsp; Completar
                      </button>
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

    <dialog-modal
      :show="confirmingComplete"
      @close="confirmingComplete = false"
    >
      <template #title>
        <div class="text-center text-gray-600">
          <font-awesome-icon icon="check"></font-awesome-icon> Completar Diezmo
        </div>
      </template>

      <template #content>
        <div class="flex justify-around">
          <div class="mt-4 w-1/2">
            <Input
              type="number"
              class="block w-full mr-1 py-2"
              placeholder="Taza del Dia"
              ref="rate"
              v-model="form.rate"
              @keyup.enter.native="complete"
            />
            <input-error :message="form.error('rate')" class="mt-2" />
          </div>
          <div class="mt-4 w-1/2">
            <select
              class="block w-full bg-gray-200 ml-1 border border-gray-200 text-gray-700 px-3 py-2 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
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
        <div class="mt-4 flex justify-around">
          <secondary-button @click.native="confirmingComplete = false">
            Cancelar
          </secondary-button>

          <Button
            @click.native="complete"
            class="bg-blue-600 hover:bg-blue-700 text-white rounded-sm"
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
