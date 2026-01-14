import AbstractService from './abstractService'
import LabelModel from '@/models/label'
import type {ILabel} from '@/modelTypes/ILabel'
import {colorFromHex} from '@/helpers/color/colorFromHex'

export default class LabelService extends AbstractService<ILabel> {
	constructor() {
		super({
			create: '/labels',
			getAll: '/labels',
			get: '/labels/{id}',
			update: '/labels/{id}',
			delete: '/labels/{id}',
		})
	}

	processModel(label) {
		// Safe date parsing
		const parseDate = (date) => {
			try {
				if (!date) return new Date().toISOString()
				const d = new Date(date)
				return Number.isNaN(d.getTime()) ? new Date().toISOString() : d.toISOString()
			} catch (_) {
				return new Date().toISOString()
			}
		}
		label.created = parseDate(label.created)
		label.updated = parseDate(label.updated)
		label.hexColor = colorFromHex(label.hexColor)
		return label
	}

	modelFactory(data) {
		return new LabelModel(data)
	}

	beforeUpdate(label) {
		return this.processModel(label)
	}

	beforeCreate(label) {
		return this.processModel(label)
	}
}
