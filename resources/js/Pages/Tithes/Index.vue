<template>
  <AppLayout>
    <div class="bg-white shadow overflow-hidden sm:rounded-lg">
      <div class="px-4 py-5 border-b border-gray-200 sm:px-6 bg-blue-600">
        <h3
          class="text-lg text-white text-center font-bold leading-6 font-medium"
        >
          <font-awesome-icon icon="money-check"></font-awesome-icon
          >&nbsp;Diezmos Actuales
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
                        Diezmo
                      </th>
                      <th
                        class="font-bold px-6 py-3 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider"
                      >
                        Fecha
                      </th>
                      <th class="font-bold px-6 py-3 bg-gray-50 text-center">
                        <inertia-link
                          :href="$route('diezmos.create')"
                          class="bg-blue-600 hover:bg-blue-700 text-white py-1 px-3 rounded-sm"
                        >
                          <font-awesome-icon icon="plus"></font-awesome-icon>
                        </inertia-link>
                      </th>
                    </tr>
                  </thead>
                  <tbody class="bg-white divide-y divide-gray-200">
                    <tr v-for="tithe in tithes" :key="tithe.id">
                      <td class="px-6 text-gray-700 py-4 whitespace-no-wrap">
                        {{ tithe.person }}
                      </td>
                      <td class="px-6 text-gray-700 py-4 whitespace-no-wrap">
                        {{
                          parseFloat(tithe.amount).toLocaleString("us", {
                            minimumFractionDigits: 2,
                            maximumFractionDigits: 2,
                          })
                        }}
                        {{ tithe.currency }}
                      </td>
                      <td class="px-6 text-gray-700 py-4 whitespace-no-wrap">
                        {{
                          parseFloat(tithe.tithe).toLocaleString("us", {
                            minimumFractionDigits: 2,
                            maximumFractionDigits: 2,
                          })
                        }}

                        {{ tithe.currency }}
                      </td>
                      <td class="px-6 text-gray-700 py-4 whitespace-no-wrap">
                        {{ tithe.date }}
                      </td>
                      <td
                        class="px-6 text-gray-700 py-4 whitespace-no-wrap text-center"
                      >
                        <inertia-link
                          :href="$route('diezmos.edit', tithe.id)"
                          class="bg-green-400 hover:bg-green-500 text-white py-1 px-3 rounded-sm"
                        >
                          <font-awesome-icon icon="pen"></font-awesome-icon>
                        </inertia-link>
                        <button
                          @click="deleteTithe(tithe.id)"
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
                      {{
                        parseFloat(total_tithe).toLocaleString("us", {
                          minimumFractionDigits: 2,
                          maximumFractionDigits: 2,
                        })
                      }}
                    </td>
                    <td
                      class="px-6 font-bold text-gray-800 py-4 whitespace-no-wrap"
                    >
                      <button
                        v-show="total_tithe > 0"
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
            <div class="mt-4 w-2/4">
                <Input
                    type="number"
                    class="mt-1 block w-full"
                    placeholder="Taza del Dia"
                    ref="rate"
                    v-model="form.rate"
                    @keyup.enter.native="complete"
                />
                    <input-error :message="form.error('rate')" class="mt-2" />
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
  props: ["tithes"],
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
      }),
      confirmingComplete: false,
    };
  },
  methods: {
    deleteTithe(id) {
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
            this.$inertia.delete(route("diezmos.destroy", id));
          }
        });
    },
    openModalComplete(){
        this.confirmingComplete = true;
        setTimeout(() => {
            this.$refs.rate.focus()
        }, 250)
    },
    async complete() {
        await this.$inertia.post(route("diezmos.complete"), this.form);

        if (parseFloat(this.form.rate) > 0) {
            this.confirmingComplete = false;
        }

    },
  },
  computed: {
    total: function () {
      return this.tithes.reduce((i, current) => parseFloat(i) + parseFloat(current.amount), 0);
    },
    total_tithe: function () {
      return this.tithes.reduce((i, current) => parseFloat(i) + parseFloat(current.tithe), 0);
    },
  },
};
</script>
