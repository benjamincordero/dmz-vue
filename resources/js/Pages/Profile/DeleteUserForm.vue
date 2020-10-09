<template>
    <action-section>
        <template #title>
            Eliminar cuenta
        </template>

        <template #description>
            Elimina permanentemente tu cuenta.
        </template>

        <template #content>
            <div class="w-full text-sm text-gray-600">
               Una vez que se elimine su cuenta, todos sus recursos y datos se eliminarán permanentemente. Antes de eliminar su cuenta, descargue cualquier dato o información que desee conservar.
            </div>

            <div class="mt-5">
                <danger-button @click.native="confirmUserDeletion">
                    Eliminar Cuenta
                </danger-button>
            </div>

            <!-- Delete Account Confirmation Modal -->
            <dialog-modal :show="confirmingUserDeletion" @close="confirmingUserDeletion = false">
                <template #title>
                    Eliminar cuenta
                </template>

                <template #content>
                   ¿Estás seguro de que deseas eliminar tu cuenta? Una vez que se elimine su cuenta, todos sus recursos y datos se eliminarán permanentemente. Ingrese su contraseña para confirmar que desea eliminar permanentemente su cuenta.

                    <div class="mt-4 flex justify-around">
                        <Input type="password" class="mt-1 block w-2/4" placeholder="Password"
                                    ref="password"
                                    v-model="form.password"
                                    @keyup.enter.native="deleteUser" />

                        <input-error :message="form.error('password')" class="mt-2" />
                    </div>
                </template>

                <template #footer>
                    <secondary-button @click.native="confirmingUserDeletion = false">
                      Cancelar
                    </secondary-button>

                    <danger-button class="ml-2" @click.native="deleteUser" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                        Eliminar cuenta
                    </danger-button>
                </template>
            </dialog-modal>
        </template>
    </action-section>
</template>

<script>
    import ActionSection from './../../components/ActionSection'
    import Button from './../../components/Button'
    import DialogModal from './../../components/DialogModal'
    import DangerButton from './../../components/DangerButton'
    import Input from './../../components/Input'
    import InputError from './../../components/InputError'
    import SecondaryButton from './../../components/SecondaryButton'

    export default {
        components: {
            ActionSection,
            Button,
            DangerButton,
            DialogModal,
            Input,
            InputError,
            SecondaryButton,
        },

        data() {
            return {
                confirmingUserDeletion: false,
                deleting: false,

                form: this.$inertia.form({
                    '_method': 'DELETE',
                    password: '',
                }, {
                    bag: 'deleteUser'
                })
            }
        },

        methods: {
            confirmUserDeletion() {
                this.form.password = '';

                this.confirmingUserDeletion = true;

                setTimeout(() => {
                    this.$refs.password.focus()
                }, 250)
            },

            deleteUser() {
                this.form.post('/user', {
                    preserveScroll: true
                }).then(response => {
                    if (! this.form.hasErrors()) {
                        this.confirmingUserDeletion = false;
                    }
                })
            },
        },
    }
</script>
