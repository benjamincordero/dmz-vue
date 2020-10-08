<template>
    <div>
        <slot name="form">
            <label for="name" class="w-full display-block">Categoria:</label>
            <input type="text" class="w-full form-input display-block" v-model="form.name" name="name" placeholder="Categoria"/>
            <input-error :message="form.error('name')" class="mt-2" />

        </slot>

        <div class="text-right w-full">
            <slot name="boton"></slot>
        </div>


    </div>


</template>

<script>
export default {
    props:['form'],
    created(){
        console.log('aqui')
    }
}
</script>
