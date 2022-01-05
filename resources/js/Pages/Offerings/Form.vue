<template>
  <div>
    <!-- FormLine -->
    <div class="flex flex-wrap">
      <div class="w-full p-4 lg:w-1/4">
        <label
          class="block mb-2 text-xs font-bold tracking-wide text-gray-700 uppercase"
          for="grid-first-name"
        >
          Persona
        </label>

        <input
          type="text"
          name="person"
          v-model="form.person"
          class="block w-full px-3 py-2 text-gray-800 placeholder-gray-400 border border-gray-300 rounded focus:outline-none focus:shadow-outline-indigo focus:border-indigo-300 focus:z-10 sm:text-sm sm:leading-5"
          placeholder="Persona"
        />
        <input-error :message="form.error('person')" class="mt-2" />
      </div>
      <div class="w-full p-4 lg:w-1/4">
        <label
          class="block mb-2 text-xs font-bold tracking-wide text-gray-700 uppercase"
          for="grid-first-name"
        >
          Monto
        </label>


        <currency-input class="block w-full px-3 py-2 text-gray-800 placeholder-gray-400 border border-gray-300 rounded focus:outline-none focus:shadow-outline-indigo focus:border-indigo-300 focus:z-10 sm:text-sm sm:leading-5" :currency="null"
        v-model="form.amount" :distraction-free="true" placeholder="Monto"/>
        <input-error :message="form.error('amount')" class="mt-2" />
      </div>
      <div class="w-full p-4 lg:w-1/4">
        <label
          class="block mb-2 text-xs font-bold tracking-wide text-gray-700 uppercase"
          for="grid-first-name"
        >
          Moneda
        </label>

        <select
          class="block w-full px-3 py-2 leading-tight text-gray-700 bg-gray-200 border border-gray-200 rounded focus:outline-none focus:bg-white focus:border-gray-500"
          id="grid-state"
          name="currency"
          v-model="form.currency"
        >
          <option value="">Seleccione</option>
          <option value="Bs">Bolivares</option>
          <option value="USD">Dolares $</option>
        </select>
        <input-error :message="form.error('currency')" class="mt-2"/>
      </div>
      <div class="w-full p-4 lg:w-1/4">
        <label
          class="block mb-2 text-xs font-bold tracking-wide text-gray-700 uppercase"
          for="grid-first-name"
        >
          Tipo
        </label>

        <select
          class="block w-full px-3 py-2 leading-tight text-gray-700 bg-gray-200 border border-gray-200 rounded focus:outline-none focus:bg-white focus:border-gray-500"
          id="grid-state"
          name="type_id"
          v-model="form.type_id"
        >
          <option value="">Seleccione</option>
          <option :value="1">Carpa</option>
          <option :value="2">Imprenta</option>
        </select>
        <input-error :message="form.error('type_id')" class="mt-2"/>
      </div>
    </div>
  </div>
</template>

<script>
    import { CurrencyInput } from 'vue-currency-input';
    import InputError from "../../components/InputError";

    export default {
        props: ["form"],
        components:{
            InputError,
            CurrencyInput
        }
    };
</script>
