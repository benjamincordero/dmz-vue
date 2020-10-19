<template>
  <div>
    <!-- FormLine -->
    <div class="flex flex-wrap">
      <div class="w-full lg:w-2/3 p-4">
        <label
          class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2"
          for="grid-first-name"
        >
          Nombre y Apellido
        </label>

        <input
          type="text"
          name="name"
          v-model="form.name"
          class="w-full block px-3 py-2 border border-gray-300 placeholder-gray-400 text-gray-800 rounded focus:outline-none focus:shadow-outline-indigo focus:border-indigo-300 focus:z-10 sm:text-sm sm:leading-5"
          placeholder="Nombre Y Apellido"
        />
        <input-error :message="form.error('name')" class="mt-2" />

      </div>

      <div class="w-full lg:w-1/3 p-4">
        <label
          class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2"
          for="grid-first-name"
        >
          Correo
        </label>
        <input
          type="email"
          name="email"
          v-model="form.email"
          class="w-full block px-3 py-2 border border-gray-300 placeholder-gray-400 text-gray-800 rounded focus:outline-none focus:shadow-outline-indigo focus:border-indigo-300 focus:z-10 sm:text-sm sm:leading-5"
          placeholder="Email"
        />
        <input-error :message="form.error('email')" class="mt-2" />

      </div>
    </div>
    <!-- EndFormLine -->

    <!-- FormLine -->
    <div class="flex flex-wrap">
      <div class="w-full lg:w-1/2 p-4">
        <label
          class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2"
          for="grid-first-name"
        >
          Role
        </label>

        <select
          class="block w-full bg-gray-200 border border-gray-200 text-gray-700 px-3 py-2 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
          id="grid-state"
          name="role"
          v-model="form.role"
        >
          <option value="">Seleccione</option>
          <option value="root">Admin</option>
          <option value="user">Normal</option>
        </select>
        <input-error :message="form.error('role')" class="mt-2" />

      </div>



      <div class="w-full lg:w-1/2 p-4">
        <label
          class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2"
          for="grid-first-name"
        >
          Password
        </label>
        <input
          type="password"
          name="password"
          v-model="form.password"
          class="w-full block px-3 py-2 border border-gray-300 placeholder-gray-400 text-gray-800 rounded focus:outline-none focus:shadow-outline-indigo focus:border-indigo-300 focus:z-10 sm:text-sm sm:leading-5"
          placeholder="*******"
        />
        <input-error :message="form.error('password')" class="mt-2" />

      </div>
    </div>
    <!-- EndFormLine -->
  </div>
</template>

<script>
import InputError from '../../../components/InputError'

export default {
    props:['form'],
    components:{
        InputError
    }
}
</script>
