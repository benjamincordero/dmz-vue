<template>
    <form-section @submitted="updatePassword">
        <template #title>
           Actualiza contraseña
        </template>

        <template #description>
            Asegúrese de que su cuenta esté usando una contraseña larga y aleatoria para mantenerse seguro.
        </template>

        <template #form>
            <div class="col-span-6 sm:col-span-4">
                <Label for="current_password" value="Contraseña Actual" />
                <Input id="current_password" type="password" class="mt-1 block w-full" v-model="form.current_password" ref="current_password" autocomplete="current-password" />
                <input-error :message="form.error('current_password')" class="mt-2" />
            </div>

            <div class="col-span-6 sm:col-span-4">
                <Label for="password" value="Nueva Contraseña" />
                <Input id="password" type="password" class="mt-1 block w-full" v-model="form.password" autocomplete="new-password" />
                <input-error :message="form.error('password')" class="mt-2" />
            </div>

            <div class="col-span-6 sm:col-span-4">
                <Label for="password_confirmation" value="Confirmar Contraseña" />
                <Input id="password_confirmation" type="password" class="mt-1 block w-full" v-model="form.password_confirmation" autocomplete="new-password" />
                <input-error :message="form.error('password_confirmation')" class="mt-2" />
            </div>
        </template>

        <template #actions>
            <action-message :on="form.recentlySuccessful" class="mr-3">
                Guardado.
            </action-message>

            <Button :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                Guardar
            </Button>
        </template>
    </form-section>
</template>

<script>
    import ActionMessage from './../../components/ActionMessage'
    import Button from './../../components/Button'
    import FormSection from './../../components/FormSection'
    import Input from './../../components/Input'
    import InputError from './../../components/InputError'
    import Label from './../../components/Label'

    export default {
        components: {
            ActionMessage,
            Button,
            FormSection,
            Input,
            InputError,
            Label,
        },

        data() {
            return {
                form: this.$inertia.form({
                    current_password: '',
                    password: '',
                    password_confirmation: '',
                }, {
                    bag: 'updatePassword',
                }),
            }
        },

        methods: {
            updatePassword() {
                this.form.put('/user/password', {
                    preserveScroll: true
                }).then(() => {
                    this.$refs.current_password.focus()
                })
            },
        },
    }
</script>
