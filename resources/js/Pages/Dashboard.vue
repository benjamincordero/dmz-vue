<template>
  <app-layout>
    <template #header>
      <h2 class="font-semibold text-xl text-gray-800 leading-tight">
        Dashboard
      </h2>
    </template>

    <div class="py-2">
      <div class="max-w-7xl mx-auto sm:px-4 lg:px-2">
        <div class="overflow-hidden">
          <div
            class="flex items-center space-y-2 space-x-1 justify-around text-center"
          >
            <inertia-link
              :href="$route('ofrendas.index')"
              class="w-full bg-white rounded-md p-4 lg:w-1/3"
            >
              <img
                src="assets/images/logos/ofrendas.svg"
                alt="diezmos"
                class="mx-auto w-40"
              />
              <h1 class="text-xl mt-4 font-bold text-blue-500">Ofrendas</h1>
            </inertia-link>
            <inertia-link
              :href="$route('transferencias.index')"
              class="w-full bg-white rounded-md p-4 lg:w-1/3"
            >
              <img
                src="assets/images/logos/transferencias.svg"
                alt="diezmos"
                class="mx-auto w-40"
              />
              <h1 class="text-xl mt-4 font-bold text-blue-500">
                Transferencias
              </h1>
            </inertia-link>
           <inertia-link
              :href="$route('diezmos.index')"
              class="w-full bg-white rounded-md p-4 lg:w-1/3"
            >
              <img
                src="assets/images/logos/diezmos.svg"
                alt="diezmos"
                class="mx-auto w-40"
              />
              <h1 class="text-xl mt-4 font-bold text-blue-500">Diezmos</h1>
            </inertia-link>
          </div>
        </div>
      </div>
    </div>
  </app-layout>
</template>

<script>
import AppLayout from "./../Layouts/AppLayout";

export default {
  components: {
    AppLayout,
  },
};
</script>
